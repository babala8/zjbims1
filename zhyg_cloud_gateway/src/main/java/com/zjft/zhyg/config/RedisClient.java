package com.zjft.zhyg.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.util.Map;

/**
 * @description
 * @create on 2019/9/5 14:38
 * @Copyright: 紫金技术
 */
@Component
public class RedisClient {

    @Autowired(required = false)
    private JedisPool jedisPool;

    /**
     * 获取连接
     *
     * @return Jedis
     */
    private synchronized Jedis getJedis() {
        Jedis jedis = null;
        if (jedisPool != null) {
            jedis = jedisPool.getResource();
        }
        return jedis;
    }

    /**
     * 返还连接
     *
     * @param jedis
     */
    private void close(Jedis jedis) {
        if (jedis != null) {
            jedis.close();
        }
    }

    /**
     * 存入map并设置过期时间
     *
     * @param key
     * @param map
     */
    public void setMap(String key, Map<String, String> map, int expireSeconds) {
        Jedis jedis = null;
        try {
            jedis = getJedis();
            jedis.setex(key.getBytes(), expireSeconds, KryoUtil.serialize(map));
        } finally {
            close(jedis);
        }
    }

    /**
     * 取出map
     *
     * @param key
     * @return
     */
    public Map<String, String> getMap(String key) {
        Jedis jedis = null;
        try {
            jedis = getJedis();
            if (jedis == null) {
                return null;
            }
            byte[] in = jedis.get(key.getBytes());
            return (Map<String, String>) KryoUtil.deserialize(in);
        } finally {
            close(jedis);
        }
    }

    /**
     * 存入string并设置过期时间
     *
     * @param key
     * @param value
     */
    public void setString(String key, String value, int expireSeconds) {
        Jedis jedis = null;
        try {
            jedis = getJedis();
            jedis.setex(key, expireSeconds, value);
        } finally {
            close(jedis);
        }

    }

    /**
     * 取出string
     *
     * @param key
     * @return
     */
    public String getString(String key) {
        Jedis jedis = null;
        try {
            jedis = getJedis();
            if (jedis == null) {
                return null;
            }
            return jedis.get(key);
        } finally {
            close(jedis);
        }
    }

    /**
     * 设置过期时间
     *
     * @param key
     * @param expireSeconds
     */
    public void expire(String key, int expireSeconds) {
        Jedis jedis = null;
        try {
            jedis = getJedis();
            jedis.expire(key, expireSeconds);
        } finally {
            close(jedis);
        }
    }

    /**
     * 移除
     *
     * @param key
     */
    public void remove(String key) {
        Jedis jedis = null;
        try {
            jedis = getJedis();
            getJedis().del(key);
        } finally {
            close(jedis);
        }
    }


}

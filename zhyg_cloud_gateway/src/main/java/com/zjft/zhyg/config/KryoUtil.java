package com.zjft.zhyg.config;

import com.esotericsoftware.kryo.Kryo;
import com.esotericsoftware.kryo.io.Input;
import com.esotericsoftware.kryo.io.Output;

/**
 * @description 序列化也反序列化工具类
 * @create on 2019/8/29 10:45
 * @Copyright: 紫金技术
 */


class KryoUtil {

    private static Kryo kryo = new Kryo();

    static byte[] serialize(Object obj) {
        byte[] buffer = new byte[2048];
        Output output = new Output(buffer);
        kryo.writeClassAndObject(output, obj);
        byte[] bs = output.toBytes();
        output.close();
        return bs;
    }

    static Object deserialize(byte[] src) {
        Input input = new Input(src);
        Object obj = kryo.readClassAndObject(input);
        input.close();
        return obj;
    }
}

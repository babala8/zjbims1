package com.zjft.zhyg.system.configure;

import com.alibaba.druid.pool.DruidDataSource;
import com.zjft.zhyg.system.common.MapWrapperFactory;
import org.apache.ibatis.mapping.DatabaseIdProvider;
import org.apache.ibatis.mapping.VendorDatabaseIdProvider;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.mybatis.spring.boot.autoconfigure.MybatisProperties;
import org.mybatis.spring.boot.autoconfigure.SpringBootVFS;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import javax.sql.DataSource;
import java.util.Properties;

/**
 * @author fqz
 * @description 主数据源配置类，扫描包com.zjft.zhyg.system.dao，给该层接口注入zjbimsSqlSessionTemplate
 */
@Configuration
@MapperScan(basePackages = "com.zjft.zhyg.system.dao", sqlSessionTemplateRef = "zjbimsSqlSessionTemplate")
public class ZjbimsDataSourceConfig {

    /**
     * 从配置文件获取主数据源的连接信息
     */
	@Value("${spring.datasource.zjbims.driver-class-name}")
    private String driverClassName;
    @Value("${spring.datasource.zjbims.url}")
    private String url;
    @Value("${spring.datasource.zjbims.username}")
    private String username;
    @Value("${spring.datasource.zjbims.password}")
    private String password;
    @Value("${mybatis.mapper-locations-zjbims}")
    private String mapperLocation;
    @Value("${mybatis.type-aliases-package}")
    private String typeAliasPackage;

    /**
     * 创建主数据源对象，注入到Spring
     */
    @Bean(name = "zjbimsDataSource")
    @Primary
    @ConfigurationProperties(prefix = "spring.datasource.druid")
    public DataSource dataSource() {
    	DruidDataSource dataSource = new DruidDataSource();
        dataSource.setDriverClassName(this.driverClassName);
        dataSource.setUrl(this.url);
        dataSource.setUsername(this.username);
        dataSource.setPassword(this.password);
        return dataSource;
    }

    @Bean
    public DatabaseIdProvider databaseIdProvider(){
        DatabaseIdProvider databaseIdProvider = new VendorDatabaseIdProvider();
        Properties p = new Properties();
        p.setProperty("Oracle", "oracle");
        p.setProperty("MySQL", "mysql");
        p.setProperty("DB2", "db2");
        databaseIdProvider.setProperties(p);
        return databaseIdProvider;
    }

    /**
     *创建SqlSessionFactory
     */
    @Bean(name = "zjbimsSqlSessionFactory")
    @Primary
    public SqlSessionFactory sqlSessionFactory(@Qualifier("zjbimsDataSource") DataSource dataSource,MybatisProperties mybatisProperties) throws Exception {
        SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
        bean.setDataSource(dataSource);
        bean.setMapperLocations(new PathMatchingResourcePatternResolver().getResources(mapperLocation));
        bean.setTypeAliasesPackage(typeAliasPackage);
        bean.setConfiguration(mybatisProperties.getConfiguration());
        bean.setDatabaseIdProvider(databaseIdProvider());
        mybatisProperties.getConfiguration().setObjectWrapperFactory(new MapWrapperFactory());
        bean.setConfiguration(mybatisProperties.getConfiguration());
        bean.setDatabaseIdProvider(databaseIdProvider());
        bean.setVfs(SpringBootVFS.class);
        return bean.getObject();
    }

    /**
     * 配置事务
     */
    @Bean(name = "zjbimsTransactionManager")
    @Primary
    public DataSourceTransactionManager transactionManager(@Qualifier("zjbimsDataSource") DataSource dataSource) {
        return new DataSourceTransactionManager(dataSource);
    }

    /**
     *创建SqlSessionTemplate
     */
    @Bean(name = "zjbimsSqlSessionTemplate")
    @Primary
    public SqlSessionTemplate sqlSessionTemplate(@Qualifier("zjbimsSqlSessionFactory") SqlSessionFactory sqlSessionFactory) throws Exception {
        return new SqlSessionTemplate(sqlSessionFactory);
    }

}

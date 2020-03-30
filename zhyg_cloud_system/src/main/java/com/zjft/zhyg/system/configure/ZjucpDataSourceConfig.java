package com.zjft.zhyg.system.configure;

import com.alibaba.druid.pool.DruidDataSource;
import org.apache.ibatis.mapping.DatabaseIdProvider;
import org.apache.ibatis.mapping.VendorDatabaseIdProvider;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.mybatis.spring.boot.autoconfigure.SpringBootVFS;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import javax.sql.DataSource;
import java.util.Properties;

/**
 * @author fqz
 * @description P端数据源配置类，扫描包com.zjft.zhyg.system.zjucp，给该层接口注入zjucpSqlSessionTemplate
 */
@ConditionalOnProperty(prefix = "spring.datasource.zjucp", name = "enable", havingValue = "true")
@Configuration
@MapperScan(basePackages = "com.zjft.zhyg.system.zjucp", sqlSessionTemplateRef = "zjucpSqlSessionTemplate")
public class ZjucpDataSourceConfig {

    /**
     * 从配置文件获取P端数据源的配置
     */
	@Value("${spring.datasource.zjucp.driver-class-name}")
    private String driverClassName;
    @Value("${spring.datasource.zjucp.url}")
    private String url;
    @Value("${spring.datasource.zjucp.username}")
    private String username;
    @Value("${spring.datasource.zjucp.password}")
    private String password;
    @Value("${mybatis.mapper-locations-zjucp}")
    private String mapperLocation;
    @Value("${mybatis.type-aliases-package}")
    private String typeAliasPackage;

    /**
     * 创建从数据源对象，注入到Spring
     */
    @Bean(name = "zjucpDataSource")
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
    public DatabaseIdProvider databaseIdProvider1(){
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
    @Bean(name = "zjucpSqlSessionFactory")
    public SqlSessionFactory sqlSessionFactory(@Qualifier("zjucpDataSource") DataSource dataSource) throws Exception {
        SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
        bean.setDataSource(dataSource);
        bean.setMapperLocations(new PathMatchingResourcePatternResolver().getResources(mapperLocation));
        bean.setTypeAliasesPackage(typeAliasPackage);
        bean.setDatabaseIdProvider(databaseIdProvider1());
        bean.setVfs(SpringBootVFS.class);
        return bean.getObject();
    }

    /**
     * 配置事务
     */
    @Bean(name = "zjucpTransactionManager")
    public DataSourceTransactionManager transactionManager(@Qualifier("zjucpDataSource") DataSource dataSource) {
        return new DataSourceTransactionManager(dataSource);
    }

    /**
     *创建SqlSessionTemplate
     */
    @Bean(name = "zjucpSqlSessionTemplate")
    public SqlSessionTemplate sqlSessionTemplate(@Qualifier("zjucpSqlSessionFactory") SqlSessionFactory sqlSessionFactory) throws Exception {
        return new SqlSessionTemplate(sqlSessionFactory);
    }

}

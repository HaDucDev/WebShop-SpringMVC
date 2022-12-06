package hdth.com.config.hibernate;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;

import javax.sql.DataSource;
import java.util.Properties;
import static org.hibernate.cfg.Environment.*;


@Configuration
@PropertySource("classpath:database.properties")
public class HibernateConfig {

    @Autowired
    private Environment env;

    @Bean
    public LocalSessionFactoryBean getSessionFactory(){
        LocalSessionFactoryBean factoryBean= new LocalSessionFactoryBean();
        factoryBean.setPackagesToScan("hdth.com.model");
        factoryBean.setDataSource(dataSource());
        factoryBean.setHibernateProperties(hibernateProperties());
        return factoryBean;
    }

    @Bean
    public DataSource dataSource(){
        DriverManagerDataSource d= new DriverManagerDataSource();
        d.setDriverClassName(env.getProperty("hibernate.connection.driverClass"));
        d.setUrl(env.getProperty("hibernate.connection.url"));
        d.setUsername(env.getProperty("hibernate.connection.username"));
        d.setPassword(env.getProperty("hibernate.connection.password"));
        return d;
    }


    public Properties hibernateProperties(){
        Properties properties =new Properties();
        properties.setProperty(SHOW_SQL, env.getProperty("hibernate.showSql"));
        properties.setProperty(DIALECT,env.getProperty("hibernate.dialect"));
        properties.setProperty(FORMAT_SQL,env.getProperty("hibernate.formatSql"));
        properties.setProperty(HBM2DDL_AUTO,env.getProperty("hibernate.hbm2ddl.auto"));
        return properties;
    }

    @Bean
    public HibernateTransactionManager transactionManager(){
        HibernateTransactionManager h=new HibernateTransactionManager();
        h.setSessionFactory(getSessionFactory().getObject());
        return h;
    }

}

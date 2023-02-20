package itstep.learning.service;

import java.sql.Connection;

public class LocalDbService implements DbService {
    @Override
    public Connection getConnection() throws RuntimeException {
        return null;
    }
}

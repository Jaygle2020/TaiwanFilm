package com.web.login.init;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;

import javax.sql.rowset.serial.SerialException;

import org.hibernate.Session;
import org.hibernate.Transaction;



public class CreateMemberExampleTablesMsSQL {
	public static void main(String[] args) throws FileNotFoundException, IOException, SerialException, SQLException {
		Session session = HibernateUtil_MsSQL.getSessionFactory().openSession();
		Transaction tx = null;
		HibernateUtil_MsSQL.close();
	}
}

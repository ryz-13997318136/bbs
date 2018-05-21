package bbs_control;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.advertisement_model;

import bbs_dao.connection;

public class advertisement_control {
	
    connection conn = new connection();
	
	Statement statement;
	ResultSet rs2;

	public List<advertisement_model> getAdvList() {
		String sql2 = "select * from advertisement";

		try {
			java.sql.Connection conn_object = conn.getconn();
			statement = conn_object.createStatement();
			rs2 = statement.executeQuery(sql2);
			List<advertisement_model> list = new ArrayList<advertisement_model>();
			while (rs2.next()) {
				advertisement_model adv = new advertisement_model();
				adv.setUrl(rs2.getString("address"));
				adv.setImage_url(rs2.getString("image_url"));

				list.add(adv);

			}
			rs2.close();
			statement.close();
			conn_object.close();
			return list;
		} catch (Exception e) {
			try {

				rs2.close();
				statement.close();
			} catch (Exception e2) {

			}
		}
		return null;
	}

}

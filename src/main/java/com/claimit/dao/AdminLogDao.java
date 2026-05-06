package com.claimit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.claimit.model.AdminLog;
import com.claimit.utils.DataBase_Config;

public class AdminLogDao {
	
	private final String createLogQuery = "insert into admin_logs (Admin_ID, Action_Type, Target_Type, Target_ID) values (?, ?, ?, ?)";
    private final String selectLogsQuery = "select al.Admin_log_ID, a.Full_Name, al.Action_Type, al.Target_Type, al.Target_ID " +
            "from admin_logs al join admins a on al.Admin_ID = a.Admin_ID";

    public boolean insertLog(AdminLog adminLog) {

        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DataBase_Config.getConnection();
            ps = con.prepareStatement(createLogQuery);

            ps.setInt(1, adminLog.getAdminId());
            ps.setString(2, adminLog.getActionType());
            ps.setString(3, adminLog.getTargetType());
            ps.setString(4, adminLog.getTargetId());

            ps.executeUpdate();

            ps.close();
            con.close();

            return true;

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public List<AdminLog> fetchAllLogs() {
        List<AdminLog> logs = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DataBase_Config.getConnection();
            ps = con.prepareStatement(selectLogsQuery);
            rs = ps.executeQuery();

            while (rs.next()) {
                AdminLog log = new AdminLog();
                log.setAdminLogId(rs.getInt("Admin_log_ID"));
                log.setFullName(rs.getString("Full_Name"));
                log.setActionType(rs.getString("Action_Type"));
                log.setTargetType(rs.getString("Target_Type"));
                log.setTargetId(rs.getString("Target_ID"));
                logs.add(log);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return logs;
    }
}
package cn.edu.cnu.iiot.mapper;

import cn.edu.cnu.iiot.pojo.Device;
import org.apache.ibatis.annotations.*;


import java.util.ArrayList;

@Mapper
public interface DeviceMapper {

    @Select("select * from device where did > #{num} limit 10")
    ArrayList<Device> getDevices(int num);

    @Insert("replace into device(did, deviceName, status, longitude, latitude) values (#{did}," +
            "#{deviceName},#{status},#{longitude},#{latitude});")
    int editDevice(Device device);

    @Select("select * from device where did = #{did};")
    Device getDeviceById(int id);

    int deleteById(int did);

    int addDevice(Device device);

    @Select("select count(*) from device;")
    int countDeviceNum();




}

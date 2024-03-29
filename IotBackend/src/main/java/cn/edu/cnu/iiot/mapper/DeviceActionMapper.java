package cn.edu.cnu.iiot.mapper;

import cn.edu.cnu.iiot.pojo.DeviceAction;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DeviceActionMapper {
    @Insert("insert into device_action(deviceName, action, param,date) values (#{deviceName}, #{action},#{param},#{date});")
    int insertDeviceAction(DeviceAction deviceAction);
}

# 物联网系统设计文档

[TOC]

## 软件功能详解

### 登录功能

用户通过浏览器提供的交互界面输入帐号和密码，前端程序获取帐号和密码，进行表单校验，通过后利用 `axios` 发送 `post` 请求给后端，后端接收到该请求后，将数据向下层传递到 `service` 层，利用用户名从数据库中查找出密码，进行匹配，符合返回成功响应，否则失败响应，前端根据响应结果决定是否放行。


### 设备管理

#### 设备列表总览

开始根据页码 `1` 发送一个 `get` 请求到后端，后端查询出第一页需要渲染的数据，默认为 `10` 个设备数据，以及总的设备个数。将其设置在统一返回体 `ResponseData` 的`data` 字段。然后返回给前端，前端拿到数据，通过返回状态码判断是否成功，成功通过表格进行渲染展示。当点击切换到不同的页码时，重新根据当前的页码发送请求，获取最新的数据进行相应的渲染。

#### 设备详细信息查看

用户点击设备列表总览中的更多按钮，通过路由携带设备的 `did` 跳转到对应的设备详情页，根据设备 `did` 发送一个 `get` 请求到后端，后端向下传递到 `service` ，并将查询到的数据进行设置，然后返回给前端，前端前数据渲染到对应的浏览器标签上。

#### 删除设备

用户点击对应的删除按钮，前端程序获取其 `did` ，一方面从该页的数据列表中删除该数据，另一方面携带着 `did` 发送一个 `delete` 请求到后端，后端同样传递到 `service` 层调用 `mapper` 层的接口方法将对应设备从数据库中删除并将结果返回给前端，前端将结果以通知的形式展示给用户。

#### 修改设备信息

用户点击对应的修改按钮，前端程序获取到对应的 `did`，去本页持有的 `tableData` 中找到对应的数据，然后将其对应的字段渲染到弹出的对话框中。用户修改后，点击确定按钮，前端获取此时的数据，发送一个 `post` 请求到后端，后端拿到数据，向下传递取出 `did`， 用 `mapper` 层的对应方法根据对应 `did` 将原始数据进行替换并返回对应的响应给前端，前端展示处理结果给用户。	

#### 增加设备

用户进入增加设备界面，输入对应的设备信息，点击增加按钮后，前端获取对应输入信息，发送一个 `post` 请求到后端，后端拿到数据，向下传递到 `service` 层。调用对应方法将该条数据插入到数据库中，并根据插入结果，返回对应的响应结果到前端，前端判断并将结果展示给用户。

#### 设备模型展示

设备模型和设备详细信息查看放到了同一个页面，具体操作是通过设备 `did` 加载不同的设备，但是目前由于设备模型有限都是同一个模型。具体的渲染和操作通过 `Threejs` 来进行。

#### 设备位置展示

当我们从设备列表切换到设备的位置展示时，我们首先将对应的页面页码和设备数据存储到 `vuex` 管理的 `store` 中，当我们点击地图页面的显示位置的时候，我们从`vuex` 管理的 `store` 中取出对应的设备列表，用其对应的设备经纬度生成	 `marker`， 然后将其加载到 `map` 中。

#### 设备位置删除

点击页面删除坐标按钮，用 `splice` 方法将当前的 `marker` 全部移除。

#### 设备动作

设备动作按钮在设备详情页，目前为设备设定的动作主要有打开和关闭，包括延时打开和延时关闭。具体操作是，当用户点击按钮，用户获取对应的操作，进行赋值，发起一个 `post` 请求给后端，后端拿到数据，将此次动作的信息记录到数据库然后判断任务类型，如果是立即打开或关闭操作，那么直接通过 `mqtt` 协议发送一个消息到对应的设备（每个设备对应一个 `topic`）。如果是延时发送，那么首先将该次动作需要的信息放入到一个延时队列中，延时队列一直轮循判断，如果有任务到了其执行时间，那么取出该任务进行执行，执行完毕后移除该任务。如果我们用 `mqttx` 订阅相应的 `topic` 可以看到对应发送的消息，如果收到消息，那么我们的此次动作视为成功，反之视为失败。

### 告警管理

#### 告警信息列表展示

此处的处理和设备列表的展示和处理类似，我们都是发送一个 `post` 请求到后端，后端查询数据并返回，前端进行对应的渲染。

#### 数据图展示

数据图展示用到的依赖主要是 `echarts` ，当我们从告警信息展示页面点击图表展示，我们用路由携带着对应的设备 `did` 然后根据 `did` 发送一个 `get` 请求得到其所有告警数据，取出温度和日期，用 `echarts` 对应方法进行设置即可。另此次主要展示了三个图，分别为数据的平均温度图，告警温度图和正常温度图。

### 定时任务时间修改

在后端中我们需要每隔一段时间求出某一个设备的工作平均温度并将其进行记录，但是传统的方法只能将此时间写死，在此我提供了修改定时任务定时时间的接口，具体用法是，用户将需要设置的 `corn` 或者 `timer` 值利用 `post` 请求发送到后端，后端修改定时任务的时间，将修改的结果返回给前端。

### 用户信息修改

用户可以修改个人密码，前端界面通过弹窗获取用户的输入，传入后端，后端首先根据用户名查询密码，如密码匹配则更新，否则返回密码错误信息，封装进统一返回结构体中，返回给前端，前端根据具体结果将信息展示给用户。

### 实时监控

此模块主要用于监控设备，对设备的事实状态做一个视频的展示，但是由于目前的技术有限，具体细节仍在进一步完善中。


## 概要设计

### 系统架构图

![](./design/design.png)

粗略的将我们的系统分为如上图所示的几个部分。整体的通信流程是：用户通过前端浏览器提供的接口向后端服务程序发出各种各样的请求，后端对请求进行响应给出返回结果。并在需要的时候对数据库中的数据进行增删改查。令模拟设备通过mqtt协议向后端程序进行消息发送并将必要数据存入数据库。

### 技术结构

|        | 技术栈                                |
| ------ | ------------------------------------- |
| 前端   | `vue2,ElementUI,threejs,amap,echarts` |
| 后端   | `springboot`                          |
| 数据库 | `mysql`                               |
| 其他   | `mqtt`                                |

### `Api`设计

#### 用户登录请求
POST /user/login

##### 请求

| 参数     | 说明     | 示例   |
| -------- | -------- | ------ |
| username | 用户昵称 | echo   |
| password | 用户密码 | 123bsb |

##### 响应
| 参数 | 说明                                 | 示例    |
| ---- | ------------------------------------ | ------- |
| code | 20000登录成功，20001错误             |         |
| type | 本次请求是否成功,success/failure     | failure |
| msg  | 本次请求携带的信息，显示指明成功出错 | success |
| data | 请求返回的自定义数据信息             |         |

#### 用户信息请求
GET /user/info

##### 请求
| 参数  | 说明     | 示例 |
| ----- | -------- | ---- |
| token | 识别用户 |      |


##### 响应
| 参数 | 说明                                           | 示例    |
| ---- | ---------------------------------------------- | ------- |
| code | 20000登录成功，20001错误                       |         |
| type | 本次请求是否成功,success/failure               | failure |
| msg  | 本次请求携带的信息，显示指明成功出错           | success |
| data | 请求返回的自定义数据信息，包括头像地址和用户名 |         |

#### 设备信息请求
GET device/all

##### 请求
| 参数    | 说明     | 示例 |
| ------- | -------- | ---- |
| pageNum | 请求页码 | 2    |

##### 响应
| 参数 | 说明                                 | 示例    |
| ---- | ------------------------------------ | ------- |
| code | 20000登录成功，20001错误             |         |
| type | 本次请求是否成功,success/failure     | failure |
| msg  | 本次请求携带的信息，显示指明成功出错 | success |
| data | 该页所有设备信息                     |         |

#### 设备修改请求
POST device/edit

##### 请求
| 参数   | 说明               | 示例                                                                           |
| ------ | ------------------ | ------------------------------------------------------------------------------ |
| Device | 修改的设备全部信息 | {deviceName: "fan", did: 3, longtitude: 122.23, latitude: 22.34, status: "on"} |

##### 响应
| 参数 | 说明                                 | 示例    |
| ---- | ------------------------------------ | ------- |
| code | 20000登录成功，20001错误             |         |
| type | 本次请求是否成功,success/failure     | failure |
| msg  | 本次请求携带的信息，显示指明成功出错 | success |

其他的同样，具体细节详见自动生成文档。

#### 在线查看

接口使用 `Restful` 风格进行接口设计并利用 `Swagger` 进行接口文档的生成，其中在线接口文档的查看方式为：启动后端项目，在浏览器输入如下路径: `http://localhost:8080/swagger-ui.html)`，可以在该界面进行接口的测试。如下图所示

![](./design/api.png)

![](./design/api1.png)

![](./design/api2.png)



### 模块化设计

#### 后端系统模块化

如下图所示，在进行后端系统设计时，我将所有的与前端有关的请求信息放置到了 `Controller` 层，其不负责处理数据，数据会向下传递到 `Service` 层，其利用 `Mappper` 层的方法处理前端请求并返回封装好的处理结果回到 `Controller` 层，最后返回给前端，一次请求处理结束。这样设计的好处在于，数据的处理和交互分开，互不影响。具体的细节做到了隐藏。

![](./design/module.png)

#### 前端系统模块化

在进行前端系统设计时，我将整体逻辑大致分为了如下图所示的几个部分。首先是浏览器通过路由页面获取 `views` 层数据并进行对应的渲染。而用户通过 `views` 层展示的各类内容发出事件请求，前端就利用 `api` 中封装的具体方法去利用 `request` 层发出 `axios` 请求。并接收后端返回的结果。其中有一些数据比如用户姓名，头像，`token` 等需要全局处理的东西，统一用 `store` 做一个管理，这样即能保证数据的有效性也能提供全局的访问。

![](./design/module-fronted.png)


## 数据库设计

### 数据表

如图在此次的设计中，我主要建立了 `6` 张主要的数据库表。分别为

| 表名                  | 功能                     |
| --------------------- | ------------------------ |
| `device`              | 存储所有设备的信息       |
| `normal_data`         | 存储设备发送的正常数据   |
| `alert_info`          | 存储设备发送的告警数据   |
| `average_temperature` | 定时任务存储平均温度数据 |
| `device_action`       | 存储对设备进行的动作     |
| `user`                | 用户数据信息             |

具体字段如下图所示

![](./design/database2.png)

<img src="./design/database1.png" style="zoom:80%;" />



## 系统界面设计

### 主界面设计一览

主界面 `dashborad` 暂无内容，其中侧边栏是动态的读取路由 `index.js` 文件进行渲染生成。

![](./design/main.png)

### 功能模块设计一览

主要功能模块展示如下，其中所有按钮功能均已实现，可启动项目查看

![](./design/device.png)

![](./design/data.png)

![](./design/graph.png)

![](./design/moreinfo.png)



## 项目启动参数配置

### 前端

```
npm i
npm run dev
```

### 后端

首先新建数据库 `iiot` ,用户名可以自定义但是要和配置文件相同, 然后用 `IDEA` 连接数据库，运行 `iiot.sql` 脚本，进行表的建立和初始数据的插入，至此，项目配置启动完毕。点击运行即可。
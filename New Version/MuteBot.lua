--1.获得 bot 对象

local bot = Bot(Account,"Key","Path")
bot:login() -- 登录


--2.定义监听函数

function listener(event) 
    --print(event)
    local msg = event.message
    local sender = event.sender
    local group = event.group


    if msg:find("来一份") and msg:find("禁言套餐") then
    	time = msg:match([[来一份(%d+)s的禁言套餐]])
    	if time == (nil) or time > 43200 then
    		time = math.random(0,120) 
    		group:sendMessage(At(sender) .. Quote(msg) .. "未能检测到正确的时间参数，自动生成随机套餐") 
    	end	
    	group:sendMessage(At(sender) .. Quote(msg) + "你的红茶已到," +tostring(time)/60 +"分钟后可继续领第二瓶") 
    	sender:mute(time)
    end
end






--3.通过 bot 对象传入监听函数
bot:subscribe("GroupMessageEvent",listener)

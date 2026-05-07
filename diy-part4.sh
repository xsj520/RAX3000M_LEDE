# Modify default IP
sed -i 's/192.168.1.1/192.168.1.2/g' package/base-files/files/bin/config_generate

sed -i 's/"网络存储"/"存储"/g' `grep "网络存储" -rl ./`
sed -i 's/"HomeProxy"/"科学上网"/g' `grep "HomeProxy" -rl ./`
sed -i 's/"启动项"/"启动项目"/g' `grep "启动项" -rl ./`
sed -i 's/"挂载点"/"挂载地点"/g' `grep "挂载点" -rl ./`
sed -i 's/"重启"/"重启开关"/g' `grep "重启" -rl ./`
sed -i 's/"主机名"/"主机名称"/g' `grep "主机名" -rl ./`
sed -i 's/"接口"/"接口设置"/g' `grep "接口" -rl ./`
sed -i 's/"无线"/"无线设置"/g' `grep "无线" -rl ./`
sed -i 's/"管理权"/"管理设置"/g' `grep "管理权" -rl ./`
sed -i 's/"软件包"/"软件包名"/g' `grep "软件包" -rl ./`
sed -i 's/"UPnP IGD 和 PCP"/"upnp设置"/g' `grep "UPnP IGD 和 PCP" -rl ./`
sed -i 's/"动态 DNS"/"动态DNS"/g' `grep "动态 DNS" -rl ./`
sed -i 's/"路由表"/"路由器表"/g' `grep "路由表" -rl ./`
sed -i 's/"路由"/"路由设置"/g' `grep "路由" -rl ./`
sed -i 's/"备份与更新"/"备份升级"/g' `grep "备份与更新" -rl ./`
sed -i 's/"DHCP"/"D H  C P"/g' `grep "DHCP" -rl ./`
sed -i 's/"DNS"/"DNS设置"/g' `grep "DNS" -rl ./`
sed -i 's/"终端"/"终端命令"/g' `grep "终端" -rl ./`
sed -i 's/"防火墙"/"防火墙区"/g' `grep "防火墙" -rl ./`
sed -i 's/"IP/MAC绑定"/"IP/MAC"/g' `grep "IP/MAC绑定" -rl ./`
sed -i 's/"智能辅助系统更新"/"系统更新"/g' `grep "智能辅助系统更新" -rl ./`
sed -i 's/"Watchcat"/"断网重启"/g' `grep "Watchcat" -rl ./`
sed -i 's/"SQM 队列管理"/"网络控制"/g' `grep "SQM 队列管理" -rl ./`
sed -i 's/"进程"/"进程情况"/g' `grep "进程" -rl ./`
sed -i 's/"ShadowSocksR Plus+"/"科学上网"/g' `grep "ShadowSocksR Plus+" -rl ./`
sed -i 's/"Plugins"/"全局设置"/g' `grep "Plugins" -rl ./`

./scripts/feeds update -a
./scripts/feeds install -a

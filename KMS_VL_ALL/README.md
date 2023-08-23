# KMS_VL_ALL - 一个精巧灵活的激活批处理
>
>准备：把KMS_VL_ALL目录放到合适的位置（无特殊字符的路径），删除或卸载其他相关KMS软件，退出杀毒软件。
零售版office需要经过[转换](https://github.com/kkkgo/office-C2R-to-VOL)成VL后才能使用KMS激活。
*注意：由于微软的限制，对于BIOS具有SLIC的品牌机，可能无法使用KMS激活Window7系统。[支持的产品](https://github.com/kkkgo/KMS_VL_ALL#supported-volume-products)

## 使用一次性的KMS手动续期激活（系统不会增加任何文件）

如果你不需要自动续期，可以直接右键管理员运行**Activate.cmd**即可。
你必须在KMS到期（默认是180天）前再次运行一次。
>Activate.cmd是一个自动激活本机所有批量产品的批处理。
它可以单独使用，如果你想用第三方的KMS服务器的话，可以编辑设置External值为1，并填上IP（或者域名）和port（默认1688）。

## 安装自动续期的KMS激活（系统会增加计划任务和必要的hook）

- 1、
 先右键管理员运行脚本**AutoRenewal-Setup.cmd**，这是一个带有KMS服务器的hook，会劫持系统的KMS组件，请让杀毒软件放行，输入y安装；如果你需要卸载，只需要再次运行他，输入y卸载。如果您使用防病毒软件，最好从扫描保护中排除此文件：
**C:\Windows\System32\SppExtComObjHook.dll**
- 2、运行**Activate.cmd**即可

>不管你是用哪种方式激活，如果你安装了新的产品，你仍至少需要运行一次**Activate.cmd**来处理产品激活。

## 其他文件

- **Check-Activation-Status-vbs.cmd** 是检查激活状态的脚本（使用VBS）。
- **Check-Activation-Status-wmic.cmd** 是检查激活状态的脚本（使用WMI）。
- **$OEM$** 是用于封装系统部署自动激活的文件夹。

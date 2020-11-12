# NeoVim

我是一个前端，所以这个配置文件更适合前端的小伙伴。我日常技术栈：`typescript`, `javascript`, `scss`。

💡：*搭配`iTerm2`、`tmux`食用更香*

## 🌈特性

- [x] 侧边栏资管管理
- [x] typescript报错提示
- [x] 文件搜索（过滤.gitignore中的文件）
- [x] 快速跳转到出错的地方
- [x] 跳转到方法的定义
- [x] 快速Rename函数和变量名
- [ ] 自动闭合`html`标签
- [ ] 保存时自动格式化
- [ ] 代码折叠
- [ ] 侧边栏资管理支持tabk打开，和拆分
- [ ] 快速注释

## 🔥快捷键

常用功能快捷键参考`vscode`。

### buffer

1. `bn`：上一个buffer，`bp`：下一个buffer。
2. `spaces + b`：列出所有的buffer，并且支持预览（鼠标停留在上次鼠标停留的地方）。

### 搜索

搜索支持文件搜索和字符串搜索。需要安装[the_silver_searcher](https://github.com/ggreer/the_silver_searcher)

> brew install the_silver_searcher

* **文件搜索**：同`Vscode`的快捷键一样使用 `Ctrl + p`
* **字符串搜索**：`Ctrl + g`

### 跳转

* **跳转类，方法的定义（Go To Definition）**：`<F12>`
* **查看当前类，方法被那些方法引用**：`<F11>`
* **跳转到出错的地方**：上一个出错的地方`Ctrl + k`、下一个出错的地方`Ctrl + j`

## 友情参考

* [RenChunhui](https://github.com/RenChunhui/nvim)

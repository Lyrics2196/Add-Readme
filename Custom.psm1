function Add-Readme {
    # 生成tree结果并处理前两行
    $treeOutput = tree /f | Select-Object -Skip 2

    # 修改第一行为".\"
    if ($treeOutput.Count -gt 0) {
        $treeOutput[0] = ".\"
    }

    # 构建文件内容
    $content = @("# README", "", "", "")  # 插入标题和空行
    $content += '```'             # 添加代码块开始标记
    $content += $treeOutput       # 添加处理后的目录结构
    $content += '```'             # 添加代码块结束标记

    # 写入文件并打开
    $content | Out-File "_README.md" -Encoding utf8
    Invoke-Item "_README.md"
}
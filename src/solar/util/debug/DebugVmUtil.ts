/** @noSelfInFile */
import FunctionInfo = debug.FunctionInfo;

export default class DebugVmUtil {

    /**
     * * 'c': the hook is called every time Lua calls a function;
     * * 'r': the hook is called every time Lua returns from a function;
     * * 'l': the hook is called every time Lua enters a new line of code.
     * 'call' | 'return' | 'line' | 'count'
     */
    static sethook(hook: (event: 'call' | 'return' | 'line' | 'count', line?: number) => any, mask: string) {
        debug.sethook(hook, mask, 0)
    }


    /**
     * 获取函数信息对应的TS的代码行
     * @param functionInfo
     */
    static getTsLine(functionInfo: FunctionInfo) {
        if (functionInfo.short_src == null) {
            return functionInfo.linedefined;
        }
        let tsLine = tostring(functionInfo.linedefined || 0)
        if (_G['__TS__sourcemap']) {
            if (_G['__TS__sourcemap'][functionInfo.short_src]) {
                tsLine = tostring(_G['__TS__sourcemap'][functionInfo.short_src][tsLine] || tsLine)
            }
        }
        return tsLine;
    }

    /**
     * 获取TS代码文件路径与名字与代码行
     * @param functionInfo
     */
    static getTsSrcLineName(functionInfo: FunctionInfo) {
        if (!functionInfo) {
            return "";
        }
        let src = functionInfo.source;
        if (!src) {
            src = "<C>";
        } else if (src.substring(src.length - 4, src.length) == ".lua") {
            src = src.substring(0, src.length - 4);
        }
        let name = functionInfo.name;
        if (!name) {
            name = "匿名";
        } else if (name.substring(name.length - 2, name.length) == "_l") {
            name = name.substring(0, name.length - 2);
        }
        let title = src + ":" + tostring(DebugVmUtil.getTsLine(functionInfo)) + ":" + name;
        return title;
    }


}
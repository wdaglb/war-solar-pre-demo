export default class HookUtil {
    // static get(name: string): object | undefined {
    //     return __hooks[name];
    // }
    //
    // static set(name: string, value: any) {
    //     __hooks[name] = value;
    //     Logger.LogDebug("Hooked: " + name)
    // }

    /**  Hook a function with your own logic that will execute after the original function. */
    static hookArguments<Args extends any[], T>(oldFunc: (...args: Args) => T, newFunc: (...args: Args) => void) {
        return (...args: Args) => {
            let val = oldFunc(...args);
            newFunc(...args);
            return val;
        };
    }

    /**  Hook a function with your own logic that will execute before the original function. */
    static hookArgumentsBefore<Args extends any[], T>(oldFunc: (...args: Args) => T, newFunc: (...args: Args) => void) {
        return (...args: Args) => {
            newFunc(...args);
            return oldFunc(...args);
        };
    }

    /**  Hook a function that will execute your own function and passes the result of the original to the new function. */
    static hookResult<Args extends any[], T>(hookFunc: (...args: Args) => T, passFunc: (value: T) => void) {
        return (...args: Args) => {
            let value = hookFunc(...args);
            passFunc(value);
            return value;
        }
    }
}

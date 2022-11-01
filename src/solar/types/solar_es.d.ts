/** @noSelfInFile */
declare function setInterval(handler:  (count: number) => boolean, timeout?: number, ...arguments: any[]): number;
declare function setTimeout(handler:  (this: void) => void, timeout?: number, ...arguments: any[]): number;
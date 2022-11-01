/** @noSelf **/
export default class RandomUtil {
    private static _SL_seed_local = (314159269 * os.time() * Math.floor(os.clock() * 1000) + 453806245);

    /**
     * 获取下一个随机整数
     * @param min
     * @param max
     */
    static nextInt(min: number, max: number): number {
        return GetRandomInt(min, max);
    }

    /**
     * 获取下一个随机实数
     * @param min
     * @param max
     */
    static nextReal(min: number, max: number): number {
        return GetRandomReal(min, max);
    }


    /**
     * 获取本地随机数 (只能在异步里使用)
     * @param min
     * @param max
     */
    private static nextLocal(): number {
        RandomUtil._SL_seed_local = (314159269 * RandomUtil._SL_seed_local + 453806245);
        return RandomUtil._SL_seed_local / 2147483648;
    }

    /**
     * 获取本地随机整数(只能在异步里使用)
     * @param min
     * @param max
     */
    static nextLocalInt(min: number, max: number): number {
        return Math.floor(RandomUtil.nextLocalReal(min, max));
    }

    /**
     * 获取本地随机实数(只能在异步里使用)
     * @param min
     * @param max
     */
    static nextLocalReal(min: number, max: number): number {
        return RandomUtil.nextLocal() % (max - min) + min;
    }


    /**
     * 根据权重随机挑选一个key
     * (可用作物品池 卡牌随机等)
     * weight 支持整数和实数
     * @param objAndWeights key与权重的对象 支持传多个
     */
    static getRandomKeyByWeight(...objAndWeights: { [key: string]: number }[]): string {
        let max = 0;
        for (let objAndWeight of objAndWeights) {
            for (let objAndWeightKey in objAndWeight) {
                max = max + objAndWeight[objAndWeightKey];
            }
        }
        let ri = RandomUtil.nextReal(0, max);
        for (let objAndWeight of objAndWeights) {
            for (let objAndWeightKey in objAndWeight) {
                ri = ri - objAndWeight[objAndWeightKey];
                if (ri <= 0) {
                    return objAndWeightKey;
                }
            }
        }
        return null;
    }

    /**
     * 是否在概率中
     * 比如:
     * 0.01为1%
     * 0.8为80%
     * @return 返回是否在这个概率了
     */
    static isInChance(chance: number): boolean {
        return GetRandomReal(0, 1) < chance;
    }

    /**
     * 返回随机的角度 0-360
     */
    static randomAngle(): number {
        return GetRandomReal(0, 360);
    }

    /**
     * 返回一个随机的0-1
     * 用着百分比 千分比 等概率计算
     */
    static randomPercent(): number {
        return GetRandomReal(0, 1);
    }

}

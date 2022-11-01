import {TextTag} from "solar/w3ts/handles/texttag";

/** @noSelf **/
export default class TextTagUtil {

    //old
    /**
     * @deprecated
     */
    static textOnUnit(unit: unit, text: string, red: number = 255, green: number = 255, blue: number = 255): TextTag {
        let textTag = new TextTag();
        textTag.setColor(red, green, blue, 255)
        textTag.setText(text, 15, true)
        SetTextTagPosUnit(textTag.handle, unit, 100);
        textTag.setVelocity(0, 0.04)
        textTag.setPermanent(false)
        textTag.setLifespan(text.length)
        return textTag
    }

    /**
     * 推荐使用此方式
     * @param text
     * @param unit
     * @param fontSize
     * @param lifespan
     * @param red
     * @param green
     * @param blue
     */
    static text(text: string, unit: unit, fontSize = 15, lifespan = 0, red: number = 255, green: number = 255, blue: number = 255): texttag {
        let textTagHandle = CreateTextTag();
        SetTextTagColor(textTagHandle, red, green, blue, 255);
        fontSize = fontSize * 0.0023;
        SetTextTagText(textTagHandle, text, fontSize);
        SetTextTagPosUnit(textTagHandle, unit, 100);
        SetTextTagVelocity(textTagHandle, 0, 0.04);
        SetTextTagPermanent(textTagHandle, false);
        if (lifespan == 0) {
            SetTextTagLifespan(textTagHandle, text.length);
        } else if (lifespan > 0) {
            SetTextTagLifespan(textTagHandle, lifespan);
        }
        return textTagHandle
    }

    /**
     * 漂浮文字随机飘向
     * @param texttag
     */
    static setRandomVelocity(texttag: texttag) {
        SetTextTagVelocity(texttag, GetRandomReal(-0.10, 0.10), GetRandomReal(0.01, 0.10))
    }


}

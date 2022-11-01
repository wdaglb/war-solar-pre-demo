/** @noSelfInFile **/

import { Handle } from "./handle";

export class MultiboardItem extends Handle<multiboarditem> {

  constructor(board: Multiboard, x: number, y: number) {
    if (Handle.initFromHandle()) {
      super();
    } else {
      super(MultiboardGetItem(board.handle, x - 1, y - 1));
    }
  }

  public destroy() {
    MultiboardReleaseItem(this.handle);
  }

  public setIcon(icon: string) {
    MultiboardSetItemIcon(this.handle, icon);
  }

  public setStyle(showValue: boolean, showIcon: boolean) {
    MultiboardSetItemStyle(this.handle, showValue, showIcon);
  }

  public setValue(val: string) {
    MultiboardSetItemValue(this.handle, val);
  }

  public setValueColor(red: number, green: number, blue: number, alpha: number) {
    MultiboardSetItemValueColor(this.handle, red, green, blue, alpha);
  }

  public setWidth(width: number) {
    MultiboardSetItemWidth(this.handle, width);
  }

  public static fromHandle(handle: multiboarditem): MultiboardItem {
    return this.getObject(handle);
  }
}

export class Multiboard extends Handle<multiboard> {

  constructor() {
    if (Handle.initFromHandle()) {
      super();
    } else {
      super(CreateMultiboard());
    }
  }

  public get columns() {
    return MultiboardGetColumnCount(this.handle);
  }

  public set columns(count: number) {
    MultiboardSetColumnCount(this.handle, count);
  }

  public get displayed() {
    return IsMultiboardDisplayed(this.handle);
  }

  public get rows() {
    return MultiboardGetRowCount(this.handle);
  }

  public set rows(count: number) {
    MultiboardSetRowCount(this.handle, count);
  }

  public set title(label: string) {
    MultiboardSetTitleText(this.handle, label);
  }

  public get title() {
    return MultiboardGetTitleText(this.handle);
  }

  public clear() {
    MultiboardClear(this.handle);
  }

  public createItem(x: number, y: number) {
    return new MultiboardItem(this, x, y);
  }

  public destroy() {
    DestroyMultiboard(this.handle);
  }

  public display(show: boolean) {
    MultiboardDisplay(this.handle, show);
  }

  public minimize(flag: boolean) {
    MultiboardMinimize(this.handle, flag);
  }

  public minimized() {
    return IsMultiboardMinimized(this.handle);
  }

  public setItemsIcons(icon: string) {
    MultiboardSetItemsIcon(this.handle, icon);
  }

  public setItemsStyle(showValues: boolean, showIcons: boolean) {
    MultiboardSetItemsStyle(this.handle, showValues, showIcons);
  }

  public setItemsValue(value: string) {
    MultiboardSetItemsValue(this.handle, value);
  }

  public setItemsValueColor(red: number, green: number, blue: number, alpha: number) {
    MultiboardSetItemsValueColor(this.handle, red, green, blue, alpha);
  }

  public setItemsWidth(width: number) {
    MultiboardSetItemsWidth(this.handle, width);
  }

  public setTitleTextColor(red: number, green: number, blue: number, alpha: number) {
    MultiboardSetTitleTextColor(this.handle, red, green, blue, alpha);
  }

  public static fromHandle(handle: multiboard): Multiboard {
    return this.getObject(handle);
  }

  public static suppressDisplay(flag: boolean) {
    MultiboardSuppressDisplay(flag);
  }
}

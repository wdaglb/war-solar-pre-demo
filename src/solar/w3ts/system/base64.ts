/** @noSelfInFile */

const chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";

export function base64Encode(input: string) {
  let output = "";
  // tslint:disable-next-line:no-conditional-assignment
  for (let block = 0, charCode = 0, idx = 0, map = chars; (input.charAt(Math.floor(idx) | 0)).length > 0 || (map = "=", idx % 1); output += map.charAt(Math.floor(63 & block >>> 8 - idx % 1 * 8))) {
    // @ts-ignore
    charCode = string.byte(input, Math.floor(idx += 3 / 4) + 1) || 0;

    if (Math.floor(idx) > input.length && charCode === 0) {
      if (output.length % 4 === 1) {
        return output + "=";
      }
      return output + "==";
    }

    if (charCode > 0xFF) {
      print("'base64Encode' failed: The string to be encoded contains characters outside of the Latin1 range.");
      return output;
    }

    block = block << 8 | charCode;
  }

  return output;
}

export function base64Decode(input: string) {
  let i = input.length;
  for (; i > 0 && input[i] !== "="; i--) { /* do nothing */ }
  const str = input.substr(0, i - 1);
  let output = "";
  if (str.length % 4 === 1) {
    print("'base64Decode' failed: The string to be decoded is not correctly encoded.");
    return output;
  }
  let bs = 0;
  // tslint:disable-next-line:no-conditional-assignment
  for (let bc = 0, buffer, idx = 0; buffer = str.charAt(idx); ~buffer && (bs = bc % 4 !== 0 ? bs * 64 + buffer : buffer, bc++ % 4) !== 0 ? output += String.fromCharCode(255 & bs >>> (-2 * bc & 6)) : 0) {
    if (`${buffer}`.length === 0) {
      break;
    }
    buffer = chars.indexOf(buffer);
    idx++;
  }
  return output;
}

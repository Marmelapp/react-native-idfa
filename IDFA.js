// @flow

import { NativeModules, Platform } from 'react-native';

const { PTRIDFA } = NativeModules;

class IDFA {
  async getAdvertiserID(): Promise<string> {
    if (Platform.OS === "ios") {
      const idfa = await PTRIDFA.getIDFA();
      if (idfa.length > 0)
        return new Promise(resolve => resolve(idfa));
      else
        return PTRIDFA.getIDFV();
    }
    else
      return PTRIDFA.getIDFA();
  }

  getIDFA(): Promise<string> {
    return PTRIDFA.getIDFA();
  }

  getIDFV(): Promise<string> {
    return Platform.OS === "ios" ? PTRIDFA.getIDFV() : new Promise(resolve => resolve(""));
  }
}

export default new IDFA();

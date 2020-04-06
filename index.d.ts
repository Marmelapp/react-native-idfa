declare module 'react-native-idfa' {
  export namespace IDFA {
    export function getAdvertiserID(): Promise<string>;
    export function getIDFA(): Promise<string>;
    export function getIDFV(): Promise<string>;
  }
}

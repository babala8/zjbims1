export class BankManagerPersion {
  constructor(
      public no?: string,
      public name?: string,
      public orgNo?: string,
      private phone?: string,
      public mobile?: string,
      public email?: string,
      private isLeader?: string,
      private isLobbymanager?: string,
      private isDevmanager?: string,
      private isDeskmanager?: string
      ) {
  }
}

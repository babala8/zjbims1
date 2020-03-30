export interface IOrgType {
    no: string;
    name: string;
    grade: string;
}

export class OrgType {
  constructor(
      public no?: string,
      public type?: string,
      public grade?: string
      ) {
  }
}

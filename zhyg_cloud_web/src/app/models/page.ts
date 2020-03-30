export class Page {
  constructor(public pageSize = 20,
              public curRow = 10,
              public totalRow = 0,
              public totalPage = 0,
              public curPage = 1) {
  }
}

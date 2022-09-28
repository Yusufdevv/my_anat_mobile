class PricesEntity {
  final int journalSubscribe;
  final int doctorSubscribe;
  final int organizationSubscribe;
  final int articlePublish;
  const PricesEntity({
    this.articlePublish = 0,
    this.doctorSubscribe = 0,
    this.journalSubscribe = 0,
    this.organizationSubscribe = 0,
  });
}

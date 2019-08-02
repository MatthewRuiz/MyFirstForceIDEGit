public class AccountHandler {
    public static void postToChatterAfterCreation(List<Account> accs) {
        for(Account a: accs) {
            ConnectApi.FeedElement feedElement = ConnectApi.ChatterFeeds.postFeedElement(null,
                                                                                         a.Id,
                                                                                         ConnectApi.FeedElementType.FeedItem,
                                                                                         'Account has been created');
        }
    }
}
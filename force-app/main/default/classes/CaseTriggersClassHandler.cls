public class CaseTriggersClassHandler {
  public static void changeStatus(list<Case> cases) {
    for (Case cs : cases) {
      if (cs.Origin == 'Email') {
        cs.Status = 'New';
        cs.Priority = 'Medium';
      }
    }
  }
}

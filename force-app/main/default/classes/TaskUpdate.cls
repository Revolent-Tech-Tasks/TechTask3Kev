public with sharing class TaskUpdate {
    public static void createTasks(Account inputAccount) {
        List<Task> newTasks = new List<Task>();
        Task taskOne = new Task(Subject = 'Feature call', Priority = 'High', Status = 'Not Started', WhatId = inputAccount.Id);
        Task taskTwo = new Task(Subject = 'Follow up 1', Priority = 'Normal', Status = 'Not Started', WhatId = inputAccount.Id);
        Task taskThree = new Task(Subject = 'Follow up 2', Priority = 'Normal', Status = 'Not Started', WhatId = inputAccount.Id);

        newTasks.add(taskOne);
        newTasks.add(taskTwo);
        newTasks.add(taskThree);

        insert newTasks;
    }
}

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class eight_Multithreading {

    static class Task implements Runnable {
        private final int taskId;

        Task(int taskId) {
            this.taskId = taskId;
        }

        @Override
        public void run() {
            System.out.println("Task ID: " + taskId + ", executed by " + Thread.currentThread().getName());
        }
    }

    public static void main(String[] args) {
        // Thread pool executor
        ExecutorService executor = Executors.newFixedThreadPool(2);

        // Submitting tasks
        for (int i = 0; i < 5; i++) {
            executor.submit(new Task(i));
        }

        executor.shutdown();
    }
}

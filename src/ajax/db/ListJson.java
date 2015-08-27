package ajax.db;

/**
 * Created by Administrator on 2015/8/25.
 */
public class ListJson {
    public ListJson(String id, String test) {
        super();
        this.id = id;
        this.test = test;
    }


    public ListJson() {
        super();
    }

    @Override
    public String toString() {
        return "ListJson{" +
                "id=" + id +
                ", test='" + test + '\'' +
                '}';
    }

    private String id;
    private String test;
    private String pid;
    private int seq;


    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getTest() {
        return test;
    }

    public void setTest(String test) {
        this.test = test;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

}

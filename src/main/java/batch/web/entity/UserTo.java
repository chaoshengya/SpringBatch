package batch.web.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * @author kris
 * @date 2023/7/9 11:17 PM
 */
@Data
public class UserTo implements Serializable {
    private int id;
    private String name;
}

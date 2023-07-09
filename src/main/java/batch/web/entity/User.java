package batch.web.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * @author kris
 * @date 2023/7/9 11:17 PM
 */
@Data
public class User implements Serializable {
    private String id;
    private String name;
}

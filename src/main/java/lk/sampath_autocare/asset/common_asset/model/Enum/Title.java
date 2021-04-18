package lk.sampath_autocare.asset.common_asset.model.Enum;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum Title {
    MR("Mr. "),
    MRS("Mrs. "),
    MISS("Miss. ");

    private final String title;
}

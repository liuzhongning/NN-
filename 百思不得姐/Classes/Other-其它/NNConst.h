
#import <UIKit/UIKit.h>

typedef enum {
    NNTopicTypeAll = 1,
    NNTopicTypePicture = 10,
    NNTopicTypeWord = 29,
    NNTopicTypeVoice = 31,
    NNTopicTypeVideo = 41
} NNTopicType;


/** 精华-顶部标题的高度 */
UIKIT_EXTERN CGFloat const NNTitlesViewH;

/** 精华-顶部标题的Y */
UIKIT_EXTERN CGFloat const NNTitlesViewY;

/** 精华-cell-间距 */
UIKIT_EXTERN CGFloat const NNTopicCellMargin;

/** 精华-cell-文字内容的Y值 */
UIKIT_EXTERN CGFloat const NNTopicCellTextY;

/** 精华-cell-底部工具条的高度 */
UIKIT_EXTERN CGFloat const NNTopicCellBottomBarH;

/** 精华-cell-图片帖子的最大高度 */
UIKIT_EXTERN CGFloat const NNTopicCellPictureMaxH;

/** 精华-cell-图片帖子一旦超过最大高度,就是用Break */
UIKIT_EXTERN CGFloat const NNTopicCellPictureBreakH;



/** XMGUser模型-性别属性值 */
UIKIT_EXTERN NSString * const NNUserSexMale;
UIKIT_EXTERN NSString * const NNUserSexFemale;

/** 精华-cell-最热评论标题的高度 */
UIKIT_EXTERN CGFloat const NNTopicCellTopCmtTitleH;

/** tabBar被选中的通知名字 */
UIKIT_EXTERN NSString * const NNTabBarDidSelectNotification;
/** tabBar被选中的通知 - 被选中的控制器的index key */
UIKIT_EXTERN NSString * const NNSelectedControllerIndexKey;
/** tabBar被选中的通知 - 被选中的控制器 key */
UIKIT_EXTERN NSString * const NNSelectedControllerKey;


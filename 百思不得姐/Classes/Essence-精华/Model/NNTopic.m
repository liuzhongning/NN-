//
//  NNTopic.m
//  百思不得姐
//
//  Created by iOS on 16/9/28.
//  Copyright © 2016年 YMWM. All rights reserved.
//

#import "NNTopic.h"
#import "MJExtension.h"
#import "NNComment.h"
#import "NNUser.h"

@implementation NNTopic {

    CGFloat _cellHeight;
    CGRect _pictureF;
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName {

    return @{
             @"small_image" : @"image0",
             @"large_image" : @"image1",
             @"middle_image" : @"image2",
             @"ID" : @"id",
             @"top_cmt" : @"top_cmt[0]"
             };
}

- (NSString *)create_time {

    // 日期格式化类
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    
    // 设置日期格式(y:年,M:月,d:日,H:时,m:分,s:秒)
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    // 帖子的创建时间
    NSDate *create = [fmt dateFromString:_create_time];
    
    if (create.isThisYear) { // 今年
        if (create.isToday) { // 今天
            NSDateComponents *cmps = [[NSDate date] dateFrom:create];
            
            if (cmps.hour >= 1) { // 时间差距 >= 1小时
                return [NSString stringWithFormat:@"%zd小时前", cmps.hour];
            } else if (cmps.minute >= 1) { // 1小时 > 时间差距 >= 1分钟
            
                return [NSString stringWithFormat:@"%zd分钟前", cmps.minute];
            } else { // 1分钟 > 时间差距
            
                return @"刚刚";
            }
        } else if (create.isYesterday) { // 昨天
        
            fmt.dateFormat = @"昨天 HH:mm:ss";
            return [fmt stringFromDate:create];
        } else { // 其他
        
            fmt.dateFormat = @"MM-dd HH:mm:ss";
            return [fmt stringFromDate:create];
        }
    } else { // 非今年
    
        return _create_time;
    }
}


- (CGFloat)cellHeight {

    if (!_cellHeight) {
        // 文字的最大尺寸
        CGSize maxSize = CGSizeMake(NNScreenW - 4 * NNTopicCellMargin, MAXFLOAT);
        
         // 计算文字的高度
        CGFloat textH = [self.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size.height;
        
        // cell的高度
        // 文字部分的高度
        _cellHeight = NNTopicCellTextY + textH + NNTopicCellMargin;
        
//        NNTopicTypeAll = 1,
//        NNTopicTypePicture = 10,
//        NNTopicTypeWord = 29,
//        NNTopicTypeVoice = 31,
//        NNTopicTypeVideo = 41
        
        // 根据段子的类型来计算cell的高度
        if (self.type == NNTopicTypePicture) { // 图片帖子
            
            // 图片显示出来的宽度
            CGFloat pictureW = maxSize.width;
            
            // 显示显示出来的高度
            CGFloat pictureH = pictureW * self.height / self.width;
            
            if (pictureH >= NNTopicCellPictureMaxH) { // 图片高度过长
                pictureH = NNTopicCellPictureBreakH;
                self.bigPicture = YES; // 大图
            }
            
            // 计算图片控件的frame
            CGFloat pictureX = NNTopicCellMargin;
            CGFloat pictureY = NNTopicCellTextY + textH + NNTopicCellMargin;
            _pictureF = CGRectMake(pictureX, pictureY, pictureW, pictureH);
            
            _cellHeight += pictureH + NNTopicCellMargin;
        } else if (self.type == NNTopicTypeVoice) { // 声音帖子
            CGFloat voiceX = NNTopicCellMargin;
            CGFloat voiceY = NNTopicCellTextY + textH + NNTopicCellMargin;
            CGFloat voiceW = maxSize.width;
            CGFloat voiceH = voiceW * self.height / self.width;
            
            _voiceF = CGRectMake(voiceX, voiceY, voiceW, voiceH);
            
            _cellHeight += voiceH + NNTopicCellMargin;
        
        } else if (self.type == NNTopicTypeVideo) { // 视频帖子
            CGFloat videoX = NNTopicCellMargin;
            CGFloat videoY = NNTopicCellTextY + textH + NNTopicCellMargin;
            CGFloat videoW = maxSize.width;
            CGFloat videoH = videoW * self.height / self.width;
            _videoF = CGRectMake(videoX, videoY, videoW, videoH);
            _cellHeight += videoH + NNTopicCellMargin;
            
        
        }
        
        // 如果有最热评论
        
        if (self.top_cmt) {
        
            NSString *content = [NSString stringWithFormat:@"%@ : %@", self.top_cmt.user.username, self.top_cmt.content];
            
            CGFloat contentH = [content boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13]} context:nil].size.height;
            
            _cellHeight += NNTopicCellTopCmtTitleH + contentH + NNTopicCellMargin;
        }
        
        // 底部工具条的高度
        _cellHeight += NNTopicCellBottomBarH + NNTopicCellMargin;
    }
    return _cellHeight;
}



@end

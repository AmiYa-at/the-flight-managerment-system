import QtQuick
import QtQuick.Layouts
import HuskarUI.Basic
import com.flight.db 1.0

ColumnLayout{

    property var current_post_index:0
    property var posts_list:[]

    Layout.fillHeight: true
    Layout.fillWidth: true

    HusMessage{
        id:order_message
        z:999
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
    }

    Loader{
        id:shared_card
        Layout.alignment: Qt.AlignHCenter
        Layout.fillHeight: true
        source: "../Components/SharedCard.qml"

        onLoaded: {
            let latest_post = DBManager.getLatestPostId();
            let post;
            if(latest_post!==-1){
                post = DBManager.queryPostDetail(latest_post,DBManager.getCurrentUserId());
                posts_list.push(post.id);
                current_post_index = 0
                if(shared_card.item){
                    shared_card.item.card_data={
                        "id":post.id,
                        "title":post.title,
                        "content":post.content,
                        "image_url":DBManager.blobToImage(post.img_blob,post.img_format)
                    }
                }
            }
            else{
                order_message.clear();
                order_message.info("没有帖子了");
            }
        }
    }
    RowLayout{
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignHCenter
        HusIconButton{
            id:last_page
            text: qsTr("上一页")
            iconSource: HusIcon.LeftOutlined
            iconSize: 10
            onClicked: {
                console.log(current_post_index);
                if(current_post_index>0){
                    current_post_index--;
                    let post = DBManager.queryPostDetail(posts_list[current_post_index],DBManager.getCurrentUserId());
                    if(shared_card.item){
                        shared_card.item.card_data={
                            "id":post.id,
                            "title":post.title,
                            "content":post.content,
                            "image_url":DBManager.blobToImage(post.img_blob,post.img_format)
                        }
                    }

                }
                else{
                    order_message.info("没有帖子了");
                }
            }
        }
        HusIconButton{
            id:next_page
            text: qsTr("下一页")
            iconSource: HusIcon.RightOutlined
            iconSize: 10
            onClicked: {
                if(posts_list.length===0){
                    order_message.info("没有帖子了");
                    return;
                }

                let post;
                let index = posts_list[current_post_index]-1;
                while(typeof post!=='object'||(typeof post==='object'&&(Object.keys(post).length===0))){
                    if(index===0){
                        console.log(post_id);
                        order_message.info("没有帖子了");
                        return;
                    }

                    post = DBManager.queryPostDetail(index,DBManager.getCurrentUserId());
                    --index;
                }
                posts_list.push(post.id);
                current_post_index++;
                if(shared_card.item){
                    shared_card.item.card_data={
                        "id":post.id,
                        "title":post.title,
                        "content":post.content,
                        "image_url":DBManager.blobToImage(post.img_blob,post.img_format)
                    }
                }
            }
        }
    }
}

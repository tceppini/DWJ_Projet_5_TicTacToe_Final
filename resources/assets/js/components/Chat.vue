<template>
    <div class="chat">
        <div class="panel panel-primary">
            <div class="panel-heading" id="accordion">
                <span class="glyphicon glyphicon-comment"></span> {{name}}
            </div>
            <div class="panel-collapse" id="collapseOne">
                <div class="panel-body">
                    <ul class="chat" id="chat">
                        <li class="left clearfix" v-for="message in messages">

                            <div class="chat-body clearfix" style="position:relative;">
                                <div class="header">
                                    <strong class="primary-font"> {{message.name}}</strong>
                                </div>
                                <p>{{message.message}} </p>
                                <span v-if="message.user_id != userid" v-on:click="report(message)" style="cursor:pointer;position:absolute;top:0px;font-size:10px;right:10px;"><i class="glyphicon glyphicon-alert"></i> Reporter</span>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="panel-footer">
                    <div class="input-group">
                        <input v-on:keyup.enter="sendMessage" v-model="message" type="text" class="form-control input-md" placeholder="Type your message here..." />
                        <span class="input-group-btn"><button class="btn btn-warning btn-md" v-on:click="sendMessage">
                                Send</button></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data: function () {
            return {
                message: null,
                messages: []
            };
        },
        props: {
            userid: {type: Number, required:true},
            name: {type: String, required: true},
            sendername: {type: String, required: true},
            receiverid: {type: Number, required: true},
            gameid: {type:Number,required:true},
            past_messages: {type:Array, required:false}
        },
        created(){

            if (this.past_messages != undefined) {
                this.messages = this.past_messages;
            }

            window.Echo.channel('chat-message'+window.userid)
                .listen('ChatMessage', (e) => {
                    if (e.user.gameid !== this.gameid) {
                        return;
                    }
                    this.messages.push({
                        id: e.user.id,
                        name: e.user.name,
                        message: e.user.message,
                        user_id: e.user.user_id
                    })
                });
        },
        methods: {
            sendMessage(){
                this.messages.push({"message" : this.message , "name" : this.sendername, "user_id": this.userid});
                window.axios.post('/chat',{
                    receiverid : this.receiverid,
                    message : this.message,
                    gameid: this.gameid
                }).then(response => {
                    this.chatMessage = "";
                }, response => {
                    this.error = 1;
                    console.log("error");
                    console.log(response);
                });
                this.message = '';
            },
            report: function(message){
                window.axios.post('/report',{
                    messageid : message.id,
                    userid : message.user_id
                }).then(response => {
                    alert('Thanks for reporting.');
                }, response => {
                    this.error = 1;
                    console.log("error");
                    console.log(response);
                });
            }
        }
    }
</script>
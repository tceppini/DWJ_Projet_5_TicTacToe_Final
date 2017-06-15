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
                        <span class="chat-img pull-left">
                        <img src="http://placehold.it/50/55C1E7/fff&amp;text=U" alt="User Avatar" class="img-circle">
                        </span>
                            <div class="chat-body clearfix">
                                <div class="header">
                                    <strong class="primary-font"> {{message.name}}</strong>
                                </div>
                                <p>{{message.message}} </p>
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
            name: {type: String, required: true},
            sendername: {type: String, required: true},
            receiverid: {type: Number, required: true}
        },
        created(){
            window.Echo.channel('chat-message'+window.userid)
                .listen('ChatMessage', (e) => {
                    this.messages.push({
                        name: e.user.name,
                        message: e.user.message
                    })
                });
        },
        methods: {
            sendMessage(){
                this.messages.push({"message" : this.message , "name" : this.sendername});
                window.axios.post('/chat',{
                    receiverid : this.receiverid,
                    message : this.message
                }).then(response => {
                    this.chatMessage = "";
                }, response => {
                    this.error = 1;
                    console.log("error");
                    console.log(response);
                });
                this.message = '';
            }
        }
    }
</script>
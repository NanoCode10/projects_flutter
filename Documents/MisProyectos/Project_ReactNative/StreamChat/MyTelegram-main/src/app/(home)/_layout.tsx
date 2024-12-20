import { Slot } from "expo-router";
import { useEffect } from "react";
import { StreamChat } from "stream-chat";


const client = StreamChat.getInstance("zszg9ff44a2u");



export default function HomeLayout() {
    useEffect(() => {
        const connect = async () => {
            await client.connectUser(
                {
                    id: "jlahey",
                    name: "Jim Lahey",
                    image: "https://i.imgur.com/fR9Jz14.png",
                },
                client.devToken("jlahey")
            );

            const channel = client.channel("messaging", "the_park", {
                name: "The Park",
            });
            await channel.watch();
        }
        connect();
    });

    return <Slot />;
}
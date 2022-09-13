<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class RssNotification extends Mailable
{
    use Queueable, SerializesModels;

    private $notification;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct( $notification )
    {
        $this->notification = $notification;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->from("geoffrey.motte@cmc-dev.com")
            ->subject('HUB - RSS Notification')
            ->view('emails.notifications', ['notification' => $this->notification ]);
    }
}

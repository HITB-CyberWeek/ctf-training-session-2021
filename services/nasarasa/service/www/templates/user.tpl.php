{extends 'page.tpl.php'}

{block 'title'}{$user->first_name} {$user->last_name}{/block}

{block 'content'}
    <h3>
        {$user->first_name} {$user->last_name}
        <small><span class="label label-success registered-at">registered at {$user->registered_at} as {$user->login}</span></small>
    </h3>
    <div>
        {foreach $planets as $planet index=$index}
            <div class="info alert alert-warning">
                Information about planet #{$index + 1}, added at <b>{$planet->added_at}</b>:
            </div>
            <div class="well well-success">
                <div><b>Declination</b>: {$planet->declination} degrees</div>
                <div><b>Hour angle</b>: {$planet->hour_angle} degrees</div>
                <div><b>Brightness</b>: {$planet->brightness}%</div>
                <div><b>Size</b>: {$planet->size}%</div>
                <div><b>Color</b>: {$planet->color}</div>
                {if $self}
                    <div class="planet-message">
                        <b>Message</b> <span class="badge">visible only for you</span>
                        <pre>{$planet->message}</pre>
                    </div>
                {/if}
            </div>
        {foreachelse}
            <div class="well">
                This user hasn't add any planets yet
            </div>
        {/foreach}
    </div>
{/block}

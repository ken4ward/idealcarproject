<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Wildside\Userstamps\Userstamps;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOneOrMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class maintenance_schedule extends Model
{
    use HasFactory;
    use Userstamps;
    public $table = "maintenance_schedule";

    public function branches()
    {
        return $this->belongsTo(vehicles::class);
    }
}

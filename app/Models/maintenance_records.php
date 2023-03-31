<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use Wildside\Userstamps\Userstamps;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOneOrMany;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class maintenance_records extends Model
{
    use HasFactory;
    use Userstamps;

    public function maintenance_schedule()
    {
        return $this->belongsTo(vehicles::class, 'vehicle_id');
    }
}

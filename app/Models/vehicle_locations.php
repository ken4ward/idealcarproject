<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Wildside\Userstamps\Userstamps;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOneOrMany;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class vehicle_locations extends Model
{
    use HasFactory;
    use Userstamps;
    public $table = "vehicle_locations";

    public function vehicles()
    {
       return $this->belongsTo(vehicles::class);
    }

}

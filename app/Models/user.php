<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Wildside\Userstamps\Userstamps;
use App\Models\branch;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOneOrMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use App\Models\user_profiles;
use App\Models\user_contacts;
use App\Models\user_logins;

class user extends Model
{
    public $table = "user";
    use HasFactory;
    use Userstamps;

    public function user_profiles()
    {
       return $this->hasOne(user_profiles::class);
    }
    public function user_contacts()
    {
        return $this->hasMany(user_contacts::class);
    }
    public function user_logins()
    {
        return $this->hasMany(user_logins::class);
    }
    public function users()
    {
        return $this->belongsToMany(branch::class);
    }
}

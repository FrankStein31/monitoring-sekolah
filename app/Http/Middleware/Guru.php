<?php

namespace App\Http\Middleware;

use Closure;

class Guru
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if ($request->user()->role != 'Guru') {
            return redirect('/');
        }
        return $next($request);
    } 

   /* public function handle($request, Closure $next)
    {
        if ($request->user()->role != 'Guru') {
            \Log::info('Access denied for user: ' . $request->user()->id);
            return redirect('/');
        }
        \Log::info('Access granted for user: ' . $request->user()->id);
        return $next($request);
    } */

}

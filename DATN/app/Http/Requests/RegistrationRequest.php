<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RegistrationRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'username'  => [
                'required',
                'min:3',
                'max:255',
                'unique:users,username',
                'alpha_num',
            ],

            'email'     => 'required|email|unique:users,email',

            'password'  => [
                'required',
                'min:3',
                'max:35',
            ],
            'confirm_password'  => [
                'required',
                'same:password',
            ],
        ];
    }
    public function messages()
    {
        return [
            'username.required'     => 'Tên tài khoản không được để trống',
            'username.min'          => 'Tên tài khoản phải dài hơn 3 kí tự',
            'username.max'          => 'Tên tài khoản không dài quá 255 kí tự',
            'username.unique'       => 'Tên tài đã tồn tại',
            'username.alpha_num'        => 'Tên tài khoản không hợp lệ',

            'email.required'        => 'Email không được để trống',
            'email.email'           => 'Email không hợp lệ',
            'email.unique'          => 'Email đã được đăng ký',

            'password.required'     => 'Mật khẩu không được để trống',
            'password.min'          => 'Mật khẩu quá ngắn',
            'password.max'          => 'Mật khẩu quá dài',

            'confirm_password.required'          => 'Mật khẩu không được để trống',
            'confirm_password.same'          => 'Không khớp mật khẩu',
        ];
    }
}
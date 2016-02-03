package model 
{
	
	/**
	 * ユーザー名のモデルクラス
	 * 
	 * @author ogino
	 */
	public class UserModel
	{
		
		//-----------------------------------------------------
		//プロパティ
		//-----------------------------------------------------		
		
		//---------------
		//name
		//---------------	
		
		/**
		 * @private
		 */
		private var _name:String;
		
		/**
		 * ユーザー名
		 */
		public function get name():String { return _name; }
		
		/**
		 * @private
		 */
		public function set name(value:String):void 
		{
			_name = value;
		}
	}

}
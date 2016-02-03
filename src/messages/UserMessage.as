package messages 
{
	/**
	 * ユーザー関連のメッセージクラス
	 * 
	 * @author ogino
	 */
	public class UserMessage extends Message 
	{
		
		//-----------------------------------------------------
		//クラス定数
		//-----------------------------------------------------			
		
		/** ユーザーデータ更新 */
		public static const UPDATE_USER_DATA:String = "updateUserData";
		
		//-----------------------------------------------------
		//コンストラクタ
		//-----------------------------------------------------			
		
		/**
		 * コンストラクタ
		 * 
		 * @param type String
		 */
		public function UserMessage(type:String) 
		{
            super(type);
        }
		
	}

}
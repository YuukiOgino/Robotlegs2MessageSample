package messages
{
    import flash.utils.getQualifiedClassName;

    /**
     * MessageDispatcherによってやり取りされるメッセージの基本クラスです。
     *
     * @author ogino
     */
    public class Message
	{

		//-----------------------------------------------------
		//プロパティ
		//-----------------------------------------------------			
		
        /** メッセージタイプ */
        public var type:String;

		//-----------------------------------------------------
		//コンストラクタ
		//-----------------------------------------------------			
		
        /**
         * コンストラクタです。
         *
         * @param type メッセージタイプ
         */
        public function Message(type:String)
		{
            this.type = type;
        }

		//-----------------------------------------------------
		//メソッド
		//-----------------------------------------------------			
		
        /**
         * オブジェクトのストリング表現を返します。
         *
         * @return オブジェクトのストリング表現
         */
        public function toString():String 
		{
            var qualifiedClassName:String = getQualifiedClassName(this);
            var className:String = qualifiedClassName.split("::")[1];
            return "[" + className + " (type = " + type + ")]";
        }
    }
}
package mediator 
{
	import events.UserChangeEvent;
	import flash.events.Event;
	import messages.UserMessage;
	import model.UserModel;
	import robotlegs.bender.bundles.mvcs.Mediator;
	import robotlegs.bender.framework.impl.MessageDispatcher;
	import views.UserView;
	
	/**
	 * ユーザー画面のメディエータクラス
	 * UserModelとUserViewの仲介を行う
	 * 「ユーザの名前が変更された」というきっかけで「ビューにその名前を反映する」タスクを実行するだけのクラス
	 * 
	 * @author ogino
	 */
	public class UserViewMediator extends Mediator
	{
		
		//-----------------------------------------------------
		//コンポーネント
		//-----------------------------------------------------			
		
		[Inject]
		/** ユーザ画面 */
		public var view:UserView;		
		
		//-----------------------------------------------------
		//プロパティ
		//-----------------------------------------------------			
		
		[Inject(name="modelName")]
		/** ユーザモデル */
		public var user:UserModel;
		
		[Inject]
		/** メッセージディスパッチャー */
		public var messageDispatcer:MessageDispatcher;		
		
		//-----------------------------------------------------
		//オーバーライドしたメソッド
		//-----------------------------------------------------			
		
		/**
		 * @inheritDoc
		 */
		public override function initialize():void
		{
			// 名前が変更されたときに呼び出すメソッドをセット
			view.addEventListener(UserChangeEvent.USER_CHANGE, view_userChange);
			
			// メッセージディスパッチャーにUserMessage.UPDATE_USER_DATAを受け取ったらコールバックを実行するようにセット
			messageDispatcer.addMessageHandler(UserMessage.UPDATE_USER_DATA, UserMessageHandler);
			
		}
		
		/**
		 * @inheritDoc
		 */
		public override function destroy():void
		{
			// 登録したメソッドを削除
			view.removeEventListener(UserChangeEvent.USER_CHANGE, view_userChange);
			
			// メッセージディスパッチャーから受け取るメッセージを削除する。これでUserMessage.UPDATE_USER_DATAは受信できなくなる
			messageDispatcer.removeMessageHandler(UserMessage.UPDATE_USER_DATA, UserMessageHandler);
		}
		
		//-----------------------------------------------------
		//メッセージハンドラー
		//-----------------------------------------------------			
		
		/**
		 * データ更新関連メッセージ　メッセージハンドラー
		 * 
		 * @param	message
		 */
		protected function UserMessageHandler(message:String):void 
		{
			switch (message) 
			{
				case UserMessage.UPDATE_USER_DATA: // このメッセージを受け取ったら画面更新する
					view.nameChange(user.name);
					break;
				default:
					break;
			}
			
		}

		//-----------------------------------------------------
		//イベントハンドラー
		//-----------------------------------------------------			
		
		/**
		 * 画面変更通知イベントハンドラー
		 * 
		 * @param	e
		 */
		private function view_userChange(e:UserChangeEvent):void 
		{
			// イベントをクローンする
			var newEvent:UserChangeEvent = UserChangeEvent(e.clone());
			// フレームワークに通知　このイベントに紐付けられたCommandクラスが呼ばれる
			eventDispatcher.dispatchEvent(newEvent);
		}		
	}

}